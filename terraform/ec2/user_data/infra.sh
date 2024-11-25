git clone https://github.com/JoaoLucasMBC/fastapi-delivery.git
sudo apt install pm2
cd fastapi-delivery
python -m venv env
source env/bin/activate
pip install -r requirements.txt
cd src
pm2 start ecosystem.config.js