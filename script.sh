:log info "Export beginning now";
:global  varDate ([/system clock get date]) ;
:global  varMonth [:pick $varDate 0 3];
:global  varDay [:pick $varDate 4 6];
:global  varYear [:pick $varDate 7 11];
:global backupfile ([$varMonth]."-".[$varDay]."-".[$varYear]."-export.rsc") ;
:log info "export pausing for 10s";
/export file=$backupfile;
:delay 10s;
:log info "export being emailed";
/tool e-mail send to="monitor@dingyue.com.tw" subject="RouterOS Taichung configuration export" body="configuration export file" file=$backupfile;
:delay 20s;
:log info "export finished";
:global yesterday3 [:put $yesterday2];
:global yesterday2 [:put $yesterday1];:
:global yesterday1 [:put $backupfile];
:file remove $yesterday3;
:log info "delete yesterday3";
