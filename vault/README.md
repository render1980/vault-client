## Steps

### 0. Start vault in docker

```
./start-vault-docker.sh
```

output:

* Root Token => root_token
* Unseal Key => unseal_key

### 1. Unseal

```
./unseal.sh {unseal_key}
```

output:
```
{
  "cluster_id": "1c2523c9-adc2-7f3a-399f-7032da2b9faf",
  "cluster_name": "vault-cluster-9ac82317",
  "version": "0.6.2",
  "progress": 0,
  "n": 1,
  "t": 1,
  "sealed": false
}
```

### 2. Create approle auth scheme & create role 

```
./approle-auth.sh {root_token}
```

### 3. Get role id

```
./approle-get-roleid.sh {root_token}
```

output:
```
{
  "auth": null,
  "warnings": null,
  "wrap_info": null,
  "data": {
    "role_id": "988a9dfd-ea69-4a53-6cb6-9d6b86474bba"
  },
  "lease_duration": 0,
  "renewable": false,
  "lease_id": "",
  "request_id": "ef5c9b3f-e15e-0527-5457-79b4ecfe7b60"
}
```

### 4. Get secret id for test role

```
./approle-get-secretid.sh {root_token}
```

output:
```
{
  "auth": null,
  "warnings": null,
  "wrap_info": null,
  "data": {
    "secret_id_accessor": "45946873-1d96-a9d4-678c-9229f74386a5",
    "secret_id": "37b74931-c4cd-d49a-9246-ccc62d682a25"
  },
  "lease_duration": 0,
  "renewable": false,
  "lease_id": "",
  "request_id": "c98fa1c2-7565-fd45-d9de-0b43c307f2aa"
}
```

### 5. Login and fetch new vault token

```
./approle-login.sh {role_id} {secret_id}
```

* `role_id` - from `appprole-get-roleid.sh`
* `secret_id` - from `approle-get-secretid.sh`

output:
```
{
  "auth": {
    "renewable": true,
    "lease_duration": 2764800,
    "metadata": {},
    "policies": [
      "default",
      "dev-policy",
      "test-policy"
    ],
    "accessor": "5d7fb475-07cb-4060-c2de-1ca3fcbf0c56",
    "client_token": "98a4c7ab-b1fe-361b-ba0b-e307aacfd587"
  },
  "warnings": null,
  "wrap_info": null,
  "data": null,
  "lease_duration": 0,
  "renewable": false,
  "lease_id": "",
  "request_id": "988fb8db-ce3b-0167-0ac7-1a568b902d75"
}
```

### 6. 
