import { MessagesRepository } from './messages.repository';

export class MessagesService {
  messagesRepository: MessagesRepository;

  constructor() {
    // Service is creating its own instance of the repository
    // DO NOT DO THIS IN PRODUCTION CODE
    // Instead, use Dependency Injection
    this.messagesRepository = new MessagesRepository();
  }

  async listAllMessages() {
    return await this.messagesRepository.findAll();
  }

  async createMessage(content: string) {
    return await this.messagesRepository.create(content);
  }

  async getMessageById(id: string) {
    return await this.messagesRepository.findOne(id);
  }
}
