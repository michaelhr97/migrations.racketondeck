Dir.chdir(File.dirname($0)) do
  command = "sem-apply --url postgresql://racketondeck@localhost/racketondeck --password"
  puts command
  exec(command)
end
