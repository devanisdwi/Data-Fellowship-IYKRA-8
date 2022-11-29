import urllib.request
from google.cloud import storage
    
# The Service Accounts Key
client = storage.Client.from_service_account_json(json_credentials_path='fellowship8-devanis-b3891121eb2b.json')
# The ID of your GCS bucket
bucket_name = "pc1_devanis"
# The path to your file to upload
source_file = urllib.request.urlopen("https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Data_visualization_process_v1.png/330px-Data_visualization_process_v1.png")
# The ID of your GCS object
destination_blob_name = "data_process.png"

def upload_blob(bucket_name, source_file, destination_blob_name):
    
    bucket = client.get_bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    blob.upload_from_string(source_file.read(), content_type='image/jpg')

    print(
        f"File {source_file} uploaded to {destination_blob_name} have been successfully."
    )

upload_blob(bucket_name, source_file, destination_blob_name)
