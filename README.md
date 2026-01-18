# cloud-resume-challenge

Challenge Details: https://cloudresumechallenge.dev/docs/the-challenge/aws/

Result: https://elenadeen.com

## Tech Stack
- Static website written in **HTML, CSS, Tailwind CSS**
- Hosted in an **S3 Bucket**
- Uses **AWS CloudFront** for HTTPS
- Visitor Count written in **JavaScript**
- Visitor Count stored in **DynamoDB**
- Uses **Lambda, API Gateway** to communicate with Database
- Lambda function written in **Python**
- AWS Infrastructure as Code, managed with **Terraform**

## Development

### Prerequisites
- Node.js and npm

### Setup
1. Install dependencies:
   ```bash
   npm install
   ```

2. Build the CSS:
   ```bash
   npx tailwindcss -i ./public/styles/tailwind.css -o ./public/styles/output.css --content "./public/**/*.{html,js}"
   ```

3. Start the development server:
   ```bash
   npm start
   ```

4. Open http://localhost:8080 in your browser

### Building for Production
The CSS is already built and production-ready. For development, rebuild the CSS when you make changes to the Tailwind configuration or add new classes.
