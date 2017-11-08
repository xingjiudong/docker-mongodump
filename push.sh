#!/usr/bin/expect
set timeout 10
set host [lindex $argv 1]
set username [lindex $argv 2]
set password [lindex $argv 3]
set src_file [lindex $argv 4] 
set dest_file [lindex $argv 5] 
spawn scp $src_file $username@$host:$dest_file
 expect {
 "(yes/no)?"
  {
  send "yes\n"
  expect "*assword:" { send "$password\n"}
 }
 "*assword:"
{
 send "$password\n"
}
}
expect "100%"
expect eof
