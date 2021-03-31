Dockerized Zenzo Masternode

1. Set your Credentials
    - Please edit the zenzo.conf file with your rpc credentials and the Masternode PrivKey + Public Server IP

2. Build the Dockerimage
    - docker build -t zenzo/v1:latest .

3. Run the Dockerimage
    - docker run -d -it --name zenzoMaster -p 26210:26210 -v /zenzoData:/zenzo-2.1.0 zenzo/v1:latest 

4. Inspect the Container
    - docker exec -it zenzoMaster bash
    - zenzo-cli getinfo

You should be able to get some Connections and start Syncing with the Blocks. Happy Staking.
