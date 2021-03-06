function file_exists_in_tree
  set -l file $argv[1]
  set -l path ./

  while true
    if test -e (string join "" $path $file)
      return 0
    end
    if test (realpath $path) = "/"
      return 1
    end
    set -l path (string join "" ../ $path)
  end
  return 1
end

