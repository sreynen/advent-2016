position = {"latitude" => 0, "longitude" => 0}
direction = 1
axis = "latitude"

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
  position[axis] = position[axis] + (number * direction)
}
puts position["latitude"] + position["longitude"]
