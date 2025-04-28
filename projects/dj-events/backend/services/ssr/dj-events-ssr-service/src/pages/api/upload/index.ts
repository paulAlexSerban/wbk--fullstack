import type { NextApiRequest, NextApiResponse } from "next";
import formidable from "formidable";
import fs from "fs";
import { PRIVATE_CMS_API_URL } from "@/config";

// Disable default body parser for this route to handle form data
export const config = {
  api: {
    bodyParser: false,
  },
};

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  const MethodsMapper = {
    POST: async () => {
      const form = formidable({ multiples: true });
      try {
        const [fields, files] = await new Promise<
          [formidable.Fields, formidable.Files]
        >((resolve, reject) => {
          form.parse(req, (err: any, fields: any, files: any) => {
            if (err) reject(err);
            resolve([fields, files]);
          });
        });

        // Create a new FormData object to send to Strapi
        const formData = new FormData();

        // Add files - Fix for PersistentFile structure in formidable
        if (files.files) {
          // Handle when files.files is an array
          if (Array.isArray(files.files)) {
            for (const file of files.files as formidable.File[]) {
              if (file.filepath && fs.existsSync(file.filepath)) {
                try {
                  const fileData = fs.readFileSync(file.filepath);
                  formData.append(
                    "files",
                    new Blob([fileData], {
                      type: file.mimetype || "application/octet-stream",
                    }),
                    file.originalFilename || "file"
                  );
                  console.log(
                    `Successfully processed file: ${file.originalFilename}`
                  );
                } catch (fileError) {
                  console.error("Error processing file:", fileError);
                }
              }
            }
          }
          // Handle when files.files is a single file
          else {
            const file = files.files as formidable.File;
            if (file.filepath && fs.existsSync(file.filepath)) {
              try {
                const fileData = fs.readFileSync(file.filepath);
                formData.append(
                  "files",
                  new Blob([fileData], {
                    type: file.mimetype || "application/octet-stream",
                  }),
                  file.originalFilename || "file"
                );
                console.log(
                  `Successfully processed file: ${file.originalFilename}`
                );
              } catch (fileError) {
                console.error("Error processing file:", fileError);
              }
            }
          }
        }

        // Send to Strapi
        const uploadResponse = await fetch(`${PRIVATE_CMS_API_URL}/upload`, {
          method: "POST",
          body: formData,
        });

        if (!uploadResponse.ok) {
          if (uploadResponse.status === 403 || uploadResponse.status === 401) {
            return res.status(403).json({
              message: "Authorization failed",
            });
          }
          console.error("Error uploading file:", {
            status: uploadResponse.status,
          });
          return res.status(500).json({
            message: "Error uploading file",
          });
        }

        const { pluralRef, refId } = fields;

        // solution for issue in Strapi not connecting references by documentId, but by DB id
        // https://github.com/strapi/strapi/issues/21427#issuecomment-2816241703
        const uploadData = await uploadResponse.json();

        const linkResponse = await fetch(
          `${PRIVATE_CMS_API_URL}/${pluralRef}/${refId}`,
          {
            method: "PUT",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              data: {
                image: {
                  id: uploadData[0].id,
                },
              },
            }),
          }
        );

        const linkData = await linkResponse.json();

        return res.status(200).json({
          message: "File uploaded successfully",
          data: { uploadData, linkData },
        });
      } catch (error) {
        console.error("Error processing upload:", error);
        return res.status(500).json({ message: "Error processing upload" });
      }
    },
    default: async () => {
      res.setHeader("Allow", ["POST"]);
      res.status(405).end(`Method ${req.method} Not Allowed`);
    },
  };

  const method = req.method as keyof typeof MethodsMapper;
  const methodHandler = MethodsMapper[method] || MethodsMapper.default;
  return methodHandler();
}
