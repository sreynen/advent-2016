with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Hash;
with Ada.Containers.Hashed_Maps;

procedure FourA is

  My_File  : FILE_TYPE;
  One_Char : CHARACTER;
  Section : INTEGER;
  Check : String(1..5);

  function Equivalent_Key (Left, Right : CHARACTER) return Boolean is
  begin
     return Left = Right;
  end Equivalent_Key;

  function Hash_Func(Key : CHARACTER) return Ada.Containers.Hash_Type is
  begin
     return Ada.Strings.Hash("" & Key);
  end Hash_Func;

  package My_Hash is new Ada.Containers.Hashed_Maps(
    Key_Type => CHARACTER,
    Element_Type => INTEGER,
    Hash => Hash_Func,
    Equivalent_Keys => Equivalent_Key
  );

  Hash : My_Hash.Map;

  Subtype Numbers is Character Range '0'..'9';
  Subtype Letters is Character Range 'a'..'z';

  function Checksum(The_Hash: My_Hash.Map) return String is
    Result : String(1..5) := "-----";
  begin
    for Index in 1..5 loop
      for Letter in Letters loop
        if The_Hash.Contains(Result(Index)) then
          if The_Hash.Contains(Letter) and The_Hash.Element(Letter) > The_Hash.Element(Result(Index)) then
            Result(Index) := Letter;
          end if;
        else
          if (The_Hash.Contains(Letter)) then
            Result(Index) := Letter;
          end if;
        end if;
      end loop;
    end loop;

    return Result;

  end Checksum;

begin

  Section := 1;

  open(My_File, In_File, "4-input.txt");
  loop
    exit when End_Of_File(My_File);
    Get(My_File, One_Char);
    Put(One_Char);

    if (One_Char in Numbers) then
      Section := 2;
    elsif (One_Char = '[') then
      Section := 3;
    elsif (One_Char = ']') then
      Section := 4;
    end if;

    if End_Of_Line(My_File) then
      New_Line;
      Section := 1;
      Check := Checksum(Hash);
      Put_Line(Check);
      Hash.Clear;
    end if;

    if (Section = 1 and One_Char in Letters) then
      if (not Hash.Contains(One_Char)) then
        Hash.Insert(One_Char, 1);
      else
        Hash.Replace(One_Char, Hash.Element(One_Char) + 1);
      end if;
    end if;

  end loop;

  Close(My_File);

end FourA;
