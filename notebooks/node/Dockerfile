FROM node:20-bookworm

# Install Python and pip, which are required for Jupyter.
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install JupyterLab using pip.
# The --break-system-packages flag is added to bypass the 'externally managed' error.
RUN pip3 install jupyterlab --break-system-packages

# Install the IJavascript kernel and globally install core libraries.
RUN npm install -g ijavascript && \
    npm install -g \
    @tensorflow/tfjs-node \
    mathjs \
    lodash \
    axios \
    papaparse

# Set the NODE_PATH environment variable so the kernel can find global modules.
ENV NODE_PATH=/usr/local/lib/node_modules

# Register the IJavascript kernel with Jupyter.
# This command makes the "Node.js" option appear in the Jupyter launcher.
RUN ijsinstall --install=global

# Set the working directory inside the container.
WORKDIR /opt/notebooks

# Expose the port Jupyter runs on.
EXPOSE 8888

# Define the command to run when the container starts.
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
