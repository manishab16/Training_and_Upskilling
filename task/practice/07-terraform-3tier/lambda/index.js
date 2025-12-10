exports.handler = async (event) => {
    console.log("Lambda executed");
    return { statusCode: 200, body: "Hello from Lambda" };
};

