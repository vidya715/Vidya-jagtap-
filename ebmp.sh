playlist()
{
echo "use ebmp ">>select.sql
   echo "-----------------------------------"
   echo "select * from song;">>select.sql
   sudo mysql -u root < select.sql
}
while true 
do
echo "1) Display Song List : "
echo "2) Search Songs : "
echo "3) Search Songs by Artist Name : "
echo "4) Create Your Own Playlist : "
echo "5) Update Your Playlist Name : " 
echo "6) Display Your Playlist"
echo "0) Exit "
echo "Enter Your Choice : "
read ch
case $ch in 
0) exit
   echo " Bye , Thank You ! "
   ;;
1) echo " Song List : "
   playlist   
   echo "___________________________________"
   echo ""
   ;;
2) echo "Enter Song Name : "
   read sng
   echo "use ebmp ">>search.sql
   echo "-----------------------------------"
   echo "select * from song where sname LIKE '%$sng%';">>search.sql
   sudo mysql -u root < search.sql
   echo "___________________________________"
   ;;
3) echo "Enter Artist Name : "
   read art
   echo "use ebmp ">>searchart.sql
   echo "-----------------------------------"
   echo "select song.sname from song,artist where song.aid=artist.aid AND artist.aname LIKE '%$art%';">>searchart.sql
   sudo mysql -u root < searchart.sql
   echo "___________________________________"
   ;;
 #echo "Enter name of Playlist : "
   #read playlist
   #echo "Enter Song Names You Want to Add in list : "
   
   #cat > $playlist


   
4) echo "create your own playlist"h
   echo "Enter your playlist name"
   read play 
   echo "use ebmp">>insert_song.sql
   playlist
   echo "Enter song name : "
   read song
   echo "insert into playlist (sid,aid) select sid,aid from song where sname LIKE '%$song';">>insert_song.sql
   echo "select * from playlist ;">>insert_song.sql
   echo "Song is Inserted ... "
   echo "___________________________________"
   sudo mysql -u root < insert_song.sql
   ;;
5) echo "Enter New Playlist Name : "
   read ply
   echo "use ebmp ">>updateply.sql
   echo "-----------------------------------"
   echo "alter table playlist rename $ply ;">>updateply.sql
   sudo mysql -u root < updateply.sql
   echo "___________________________________"
   ;;
6) echo "Your Playlist List : "
   echo "use ebmp ">>list.sql
   echo "-----------------------------------"
   echo "select sid,aid,sname from song where sid IN(select sid from playlist) AND aid IN(select aid from playlist);">>list.sql
   sudo mysql -u root < list.sql
    
   echo "___________________________________"
   ;; 
 esac
done

