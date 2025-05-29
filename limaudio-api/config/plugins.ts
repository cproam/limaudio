export default ({ env }) => ({
    upload: {
        config: {
            provider: 'aws-s3',
            providerOptions: {
                credentials: {
                    accessKeyId: env('S3_ACCESS_KEY_ID'),
                    secretAccessKey: env('S3_ACCESS_SECRET'),
                },
                region: env('S3_REGION'),
                endpoint: env('S3_ENDPOINT'),
                params: {
                    Bucket: env('S3_BUCKET'),
                },
            },
        },
    },
});
