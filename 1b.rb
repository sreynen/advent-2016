position = {"latitude" => 0, "longitude" => 0}
positions = []
direction = 1
axis = "latitude"
found = false

fileObj = File.new("1-input.txt", "r")
while (line = fileObj.gets)
  content = line.split(", ")
end
fileObj.close
content.each {
  |item|
  letter = item[0]
  number = item[1..-1].to_i
  if letter == "L"
    if axis == "latitude"
      axis = "longitude"
      direction = direction * -1
    else
      axis = "latitude"
    end
  else
    if axis == "latitude"
      axis = "longitude"
    else
      axis = "latitude"
      direction = direction * -1
    end
  end
  while number > 0
    position[axis] = position[axis] + direction
    if positions.include? position
      puts position["latitude"] + position["longitude"]
      found = true
      break
    else
      positions = positions.push(position.dup)
    end
    number = number - 1
  end
  break if found
}
