# Watson NLP custom model

This project contains assets and information related to create a custom Watson NLP for Embed models.

Related blog post [Customize a model for Watson NLP for Embed](https://suedbroecker.net/2023/01/17/customize-a-model-for-watson-nlp/).

### Step 1: Clone the repository

```sh
git clone https://https://github.com/thomassuedbroecker/watson-nlp-custom-model.git
cd watson-nlp-custom-model
```

### Step 2: Navigate to the `docker` folder

```sh
cd docker
```

### Step 3: Create a `.env` file

```sh
cat .env_template > .env
```

### Step 4: Add an IBM Cloud access key to your local `.env` file

```sh
nano .env
```

Content of the file:

```sh
export IBM_ENTITLEMENT_KEY="YOUR_KEY"
export IMAGE_REGISTRY="cp.icr.io/cp/ai"
export RUNTIME_IMAGE="watson-nlp-runtime:1.0.20"
export WATSON_RUNTIME_BASE="$IMAGE_REGISTRY/$RUNTIME_IMAGE"
```

### Step 5: Execute the bash automation

>The creation can take up to 10 minutes for the download of the runtime image.

```sh
sh run-watson-nlp-with-docker.sh
```

* Example output:

```sh
# ******
# Connect to IBM Cloud Container Image Registry: cp.icr.io/cp/ai
# ******

IBM_ENTITLEMENT_KEY: 
...

Login Succeeded

# ******
# Build container image locally
# Runtime container image: cp.icr.io/cp/ai/watson-nlp-runtime:1.0.20
# ******
[+] Building 0.2s (7/7) FINISHED                                  
 => [internal] load build definition from 
 ...
 
# ******
# Run NLP
# ******

# Run the runtime with the models mounted

[STARTING RUNTIME]
...
"2023-01-25T10:25:07.040114"}
[STARTING GATEWAY]
2023/01/25 10:25:07 Running with INSECURE credentials
2023/01/25 10:25:07 Serving proxy calls INSECURE
```