
# AWS IAM User with Read and Write S3 Permissions

This document demonstrates the creation of an IAM user, attachment of a read/write S3 policy, and verification of access.

---

## ✅ Steps Followed

1. **Created a new IAM user** from the AWS Management Console.
2. **Attached a custom policy** that grants read and write access to S3.
3. **Tested the user permissions** using AWS CLI and verified that the user was able to:
   - Upload files to an S3 bucket.
   - List objects in the bucket.
   - Download files from the bucket.
   - Delete objects.

---

## 📸 Screenshots

### IAM User Created
![IAM User](iamuser.png)

### Permissions Attached to IAM User
![Permissions Screenshot](permission.png)

---

## 🛡️ Notes

- Ensure that the IAM user has **programmatic access** enabled.
- The policy should explicitly allow necessary S3 actions like `s3:PutObject`, `s3:GetObject`, `s3:ListBucket`, and `s3:DeleteObject`.
- Test with AWS CLI by configuring credentials:
  ```bash
  aws configure
  ```

---

## ✅ Success

The IAM user successfully performed read and write operations on the S3 bucket, confirming that the policy works as expected.
