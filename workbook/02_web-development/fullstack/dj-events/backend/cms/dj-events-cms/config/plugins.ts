export default ({ env }) => ({
    upload: {
        config: {
            provider: 'aws-s3',
            providerOptions: {
              baseUrl: env('CDN_URL', 'http://localhost:3000') + '/uploads-storage', // LocalStack URL
              rootPath: env('CDN_ROOT_PATH', 'media'), // LocalStack bucket name
              s3Options: {
                credentials: {
                  accessKeyId: env('AWS_ACCESS_KEY_ID', 'localstack'),
                  secretAccessKey: env('AWS_SECRET_ACCESS_KEY', 'localstack'),
                },
                region: env('AWS_REGION', 'us-east-1'),
                params: {
                  ACL: env('AWS_ACL', 'public-read'),
                  signedUrlExpires: env('AWS_SIGNED_URL_EXPIRES', 15 * 60),
                  Bucket: env('AWS_UPLOADS_BUCKET_NAME', 'uploads-storage'),
                },
                endpoint: env('AWS_ENDPOINT', 'http://localstack:4566'), // LocalStack endpoint
                forcePathStyle: true
              },
            },
            actionOptions: {
              upload: {},
              uploadStream: {},
              delete: {},
            },
            sizeOptimization: true,
            quality: 80,
            // Caution: Breakpoint changes will only apply to new uploads
            // existing images will not be resized
            // *2x breakpoints are automatically generated for retina displays
            breakpoints: {
              thumbnail: 240, 
              small: 425,
              small2x: 850,
              medium: 768,
              medium2x: 1536,
              large: 1024,
              large2x: 2048,
              xlarge: 1920,
              xlarge2x: 3840,
            },
            // Optional: You can define custom image formats here
            // provider: 'local', // or 'cloudinary', 'aws-s3', etc. if you're using a cloud storage provider
            // providerOptions: {
            //     sizeOptimization: true,
            //     quality: 80, // adjust image quality (optional)
            // },
            // breakpoints: {
            //     // Define your custom image formats here
            //     thumbnail: 150, // width of 150px
            //     small: 300, // width of 300px
            //     medium: 600, // width of 600px
            //     large: 1000, // width of 1000px
            //     custom: 1200, // custom width of 1200px (example)
            // },
        },
    },
});
