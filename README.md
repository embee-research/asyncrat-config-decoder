# AsyncRAT - Dynamic Invocation With Powershell


A script that can be used to decrypt values from AsyncRAT malware. 
- Loads the file into memory via reflection
- Instantiates an object (Client.Algorithm.Aes256) containing the Decrypt method. 
- For each encrypted value, invokes the Decrypt method to obtain the plaintext value. 

The file used can be be found here. 

- https://bazaar.abuse.ch/sample/2a2d9b1e17cd900edcdf8d26a8ba95ba41ae276d4e0d2400e85602c51e0ab73b/

If run successfully, the script should output something like this. 

<img width="906" alt="image" src="https://user-images.githubusercontent.com/82847168/200213781-4026f403-19c4-49ac-b25e-8346dfc9b4b6.png">

The script calls these Decrypt methods from the AsyncRAT code. 

<img width="893" alt="image" src="https://user-images.githubusercontent.com/82847168/200213949-82cbb44b-be6f-47f9-8986-6ac315ed07d9.png">


Which is used to decrypt these values. 

<img width="897" alt="image" src="https://user-images.githubusercontent.com/82847168/200214148-8de8bdea-6b2f-4402-986e-710cdd8a9ded.png">


