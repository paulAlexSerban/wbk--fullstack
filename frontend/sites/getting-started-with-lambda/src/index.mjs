import * as fs from "node:fs";

const html = fs.readFileSync("index.html", { encoding: "utf8" });

const dynamicForm = (html, queryStringParameters) => {
  let formres = "";
  if (queryStringParameters) {
    Object.values(queryStringParameters).forEach((val) => {
      formres = formres + val + " ";
    });
  }
  return html.replace(
    "{formResults}",
    "<h4>Form Submission: " + formres + "</h4>"
  );
};

const handler = async (event) => {
  let modifiedHTML = dynamicForm(html, event.queryStringParameters);
  const response = {
    statusCode: 200,
    headers: {
      "Content-Type": "text/html",
    },
    body: modifiedHTML,
  };
  return response;
};

export { handler };
