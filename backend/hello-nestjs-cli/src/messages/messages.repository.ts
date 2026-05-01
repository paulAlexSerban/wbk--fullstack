import { readFile, writeFile } from 'fs/promises';

export class MessagesRepository {
  async findOne(id: string): Promise<string> {
    const contents = await readFile('messages.json', 'utf-8');
    const messages = JSON.parse(contents);

    return messages[id];
  }

  async findAll(): Promise<string[]> {
    const contents = await readFile('messages.json', 'utf-8');
    const messages = JSON.parse(contents);
    return messages;
  }

  async create(message: string): Promise<void> {
    const contents = await readFile('messages.json', 'utf-8');
    const messages = JSON.parse(contents);
    const id = Math.floor(Date.now() * Math.random())
      .toString()
      .split('')
      .slice(0, 8)
      .join('');
    messages[id] = { message, id };
    await writeFile('messages.json', JSON.stringify(messages));
  }
}
