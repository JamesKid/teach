<?php  
$www_folder = "/var/www/team/teach/teach";  
//在这里获取到了用户提交的内容, 以及提交者等等, 可以记录到数据库中供以后使用  
$raw_json = file_get_contents('php://input');  
print_r(json_decode($raw_json, true));  
echo shell_exec(" cd $www_folder ; git pull 2>&1");  
//echo shell_exec("whoami 2>&1");   //查看执行命令的用户,这个用户要与nginx,apache,fpm用户一致,分配该用户执行git pull权限
?>
