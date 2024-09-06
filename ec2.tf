resource "aws_instance" "app" {

    count = length(var.subnet_cidr)
    ami = "ami-08ee1453725d19cdb"
  instance_type = "t2.micro"
subnet_id = aws_subnet.subnet[count.index].id
vpc_security_group_ids = [aws_security_group.app_sg.id]
iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
associate_public_ip_address = true

user_data =  <<-EOF
#!/bin/bash
yum update-y
amazon-linux-extras install docker
service docker start 
usermod -a -G docker ec2-user
 yum update -y
 yum install -y amazon-linux-extras
 amazon-linux-extras install epel -y
 yum install -y fuse s3fs-fuse  
  # Set up s3fs with IAM role permissions
 echo "my-aws-access-key:my-aws-secret-key" > /etc/passwd-s3fs
 chmod 600 /etc/passwd-s3f 
  # Mount S3 bucket to a directory
 mkdir -p /mnt/s3bucket
 s3fs my-shared-bucket-112233 /mnt/s3bucket -o iam_role=auto -o allow_othe 
  # Add to fstab to remount after reboot
 echo "s3fs#my-shared-bucket-112233 /mnt/s3bucket fuse _netdev,iam_role=auto,allow_other 0 0" >> /etc/fstab
  
EOF
tags = {
 Name = "AppInstance-${count.index + 1}"
}
}