FROM ubuntu:latest

# set working directory?
# WORKDIR /trainer

# install python
RUN apt update
RUN apt install python3-pip -y

# install python packages
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy python files
COPY unzip.py unzip.py
COPY datasort.py datasort.py
COPY traintestsplit.py traintestsplit.py
COPY train.py train.py

# run pre-processing steps
RUN ["python3", "unzip.py"]
RUN ["python3", "datasort.py"]
RUN ["python3", "traintestsplit.py"]

# run actual training script
CMD ["python3", "train.py"]

# if we need to pass in additional parameters, use entrypoint instead.
# this basically runs 
# >>python3 train.py [INPUTS*]

# ENTRYPOINT ["python3", "train.py"]

