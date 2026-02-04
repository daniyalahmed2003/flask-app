#1 base image (OS)
FROM python:3.11-slim

#2 working directory for the app
WORKDIR /app

#3 copy the code from your HOST to your Container (working dir)
COPY app.py run.py requirements.txt ./

#4 Run the commands to install libs or to compile code
RUN pip install --no-cache-dir -r requirements.txt

#5 Expose the port
EXPOSE 5000

#6 Serve the app / Keep it running
CMD ["python", "run.py"]
