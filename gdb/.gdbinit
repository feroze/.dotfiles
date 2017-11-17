define cls
shell clear
end
document cls
Clears the screen with a simple command.
end

define bl
info breakpoints
end
document bl
List breakpoints
end

# save upto 10000 gdb commands on file
set history filename ~/.gdb_history
set history save on
set history size 10000
