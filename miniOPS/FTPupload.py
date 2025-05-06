from ftplib import FTP
import os


def upload_file_to_ftp(ftp_server, ftp_username, ftp_password, local_directory, remote_directory):
    # Connect to the FTP server
    ftp = FTP(ftp_server)
    ftp.login(ftp_username, ftp_password)
    ftp.encoding = 'utf-8'

    # Change to the remote directory where you want to upload files
    ftp.cwd(remote_directory)

    # Walk through the local directory and upload files
    for filename in os.listdir(local_directory):
        local_filepath = os.path.join(local_directory, filename)

        # Skip directories and only upload files
        if os.path.isfile(local_filepath):
            with open(local_filepath, 'rb') as file:
                print(f"Uploading {filename}...")
                ftp.storbinary(f"STOR {filename}", file)

    # Close the FTP connection
    ftp.quit()
    print("Upload complete.")


# Example usage
ftp_server = "139.9.142.195"  # Replace with your FTP server address
ftp_username = "ftpadmin"  # Replace with your FTP username
ftp_password = "Abcd_1234Xl"  # Replace with your FTP password
#local_directory = "D:\\wikiPage\\upload\\"  # Directory to upload files from
local_directory = "D:\\监控备份\\grafana_dashboard\\postgres"
remote_directory = "/ftp/data/jira"  # Directory on the FTP server to upload files to

upload_file_to_ftp(ftp_server, ftp_username, ftp_password, local_directory, remote_directory)
