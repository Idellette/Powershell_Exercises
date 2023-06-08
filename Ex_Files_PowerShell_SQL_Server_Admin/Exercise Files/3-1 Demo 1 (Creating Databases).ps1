#Get a server object which corresponds to the default instance  
cd \sql\localhost\  
$srv = get-item default  
  
#Create a new database  
$db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $srv, "Test3"  
$db.Create()  
  
#Reference the database and display the date when it was created.   
$db = $srv.Databases["Test3"]  
$db.CreateDate  
  
#Drop the database  
$db.Drop()