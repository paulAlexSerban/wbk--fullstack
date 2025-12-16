# Hello Scratch NestJS

> basic NestJS project built from scratch, not using the NestJS CLI
> coursework project from: "NestJS: The Complete Developer's Guide" by Stephen Grider

## File naming convention

- `main.ts` - entry point of the application

```ts
function bootstrap() {...}
```

- `app.controller.ts` - controller for handling incoming requests

```ts
@Controller()
export class AppController {...}
```

- `app.module.ts` - module that encapsulates the application logic

```ts
@Module({
  imports: [...],
  controllers: [AppController],
  providers: [...],
})
export class AppModule {}
```
### Conventions
- one class per file (there are some exceptions)
- class names should include the kind of thing they are (e.g. `AppController`, `AppService`)
- file names should be the same as the class names, but in kebab-case (e.g. `app.controller.ts`, `app.service.ts`)
- files should be placed in a directory that matches the class name (e.g. `app.controller.ts` in `app/` directory)
- directories should be named in kebab-case (e.g. `app/`, `user/`, `auth/`)
- file name template: `<name>.<type_of_thing>.ts`
- type of thing can be `controller`, `service`, `module`, `dto`, `entity`, etc.
- 