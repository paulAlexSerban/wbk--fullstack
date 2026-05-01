import { Controller, Get } from "@nestjs/common";

/**
 * This is a basic NestJS application that serves a "Hello World!" message.
 * It is built from scratch without using the NestJS CLI.
 */
@Controller()
class AppController {
  @Get()
  getHello(): string {
    return "Hello World!";
  }

  @Get("/bye")
  getByeThere(): string {
    return "Bye there!";
  }
}

export default AppController;
