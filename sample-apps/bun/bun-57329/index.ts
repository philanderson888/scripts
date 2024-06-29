console.log("hello world from bun - about to run a bun server");
Bun.serve({
    port: 57329,
    fetch(request) {
      return new Response("hello world from a bun server on port 57329 from phil");
    },
  });