#Powershell Script to Decode values from AsyncRAT. 
#Written by @Embee_research @HuntressLabs
#https://twitter.com/embee_research

#Read the file into memory as a byte array
#Make sure to Replace this with the path to your file 
#https://bazaar.abuse.ch/sample/2a2d9b1e17cd900edcdf8d26a8ba95ba41ae276d4e0d2400e85602c51e0ab73b/
$data = [io.file]::readallbytes(".\async.bin");
#Load the file via reflection
$ref = [reflection.assembly]::load($data)

#Initialize the "Settings.Key" value, used to create Aes256 key. 
#You can find this in "Settings.Key" within the AsyncRat malware. 
$key = [system.text.encoding]::UTF8.Getstring([System.Convert]::Frombase64string("cDJCV3RMcDNydTZ3TlJtdFk3YjF0cVZwWkFwM0xldjM="));
#initilize an "Client.Algorithm.Aes256" object, this is necessary to call the decrypt method. 
$ini = [Activator]::CreateInstance($ref.modules[0].GetType("Client.Algorithm.Aes256"),@($key));

#This is a list of all encrypted values, "Settings.Hosts" (C2) "Settings.Ports" Settings.MTX etc
#Replace these if using a different sample to Sha256:2a2d9b1e17cd900edcdf8d26a8ba95ba41ae276d4e0d2400e85602c51e0ab73b
$enc_list = ("gQtlFsxc6oEmGpCBPugU9rN/69UaKPFRNfJ31pCA4H4VHMZ8E5yLqS9j8O5czd7rtmyLWzcMDvviqjG2SYhMnQ==", "AsjFLnLsVMAI0BjmcZCkuoKQZE0BcIKhNEzRpJMRie5oDzYc0iYSaAJR5hQCA4LxQ40zea4B/kxjJn3cLdbmTQ==");

#Iterate through list of encrypted values
foreach ($encoded in $enc_list){
        #For each encrypted value, call the decrypt method from the malware
        $result = $ref.modules[0].GetType("Client.Algorithm.Aes256").GetMethod("Decrypt", ([String])).Invoke($ini, @($encoded));
        #Print the result to the screen. 
        $result

 
}

