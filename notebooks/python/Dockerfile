# Start from your custom base image that already has git, curl, etc.
FROM devbase:latest

# The 'enthu' user and home directory are already set up in the base image.
USER enthu
WORKDIR /home/enthu

# 1. INSTALL ANACONDA
RUN wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-aarch64.sh -O anaconda_installer.sh \
  && bash anaconda_installer.sh -b -p /home/enthu/anaconda3 \
  && rm anaconda_installer.sh

# Add Anaconda to the PATH for all subsequent RUN commands and for the final container
ENV PATH="/home/enthu/anaconda3/bin:$PATH"

# 2. SET UP THE MACHINE LEARNING REPO AND ENVIRONMENT
WORKDIR /home/enthu
COPY --chown=enthu:enthu environment.yml /home/enthu/environment.yml
RUN conda env create -f environment.yml
COPY --chown=enthu:enthu serverstart.sh /home/enthu/serverstart.sh
RUN chmod +x /home/enthu/serverstart.sh

# 4. CONFIGURE CONTAINER STARTUP
EXPOSE 8888
#CMD ["conda", "run", "-n", "mlbook", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''"]
