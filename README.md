Dockerized Zenzo Masternode

1. Set your Credentials
    - Please edit the zenzo.conf file with your rpc credentials and the Masternode PrivKey + Public Server IP
    - Edit the config.json for the Forge Node with your credentials.

2. Build the Dockerimage
    - docker build -t zenzo/v1:latest .

3. Run the Dockerimage
    - docker run -d -it --name zenzoMaster -p 26210:26210 -v zenzoData:/zenzo-2.1.0 zenzo/v1:latest 
    - docker exec -it zenzoMaster ./start.sh

4. Inspect the Container or paste your config stuff manual in the container. You can find your zenzo.conf in /root/.zenzo/
    - docker exec -it zenzoMaster zenzo-cli getinfo
    - zenzo-cli getinfo

You should be able to get some Connections and start Syncing with the Blocks. Happy Staking.

You also can check the status of your Masternode per docker exec -it zenzoMaster zenzo-cli getinfo
Please change the RPC password in your config file!
