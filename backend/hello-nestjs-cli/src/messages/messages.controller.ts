import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  NotFoundException,
} from '@nestjs/common';

import { CreateMessageDto } from './dtos/create-message.dto';
import { MessagesService } from './messages.service';
@Controller('messages')
export class MessagesController {
  private messagesService: MessagesService;

  constructor() {
    // DO NOT DO THIS IN PRODUCTION CODE
    // This is just for demonstration purposes
    // In real applications, use Dependency Injection to inject the service
    this.messagesService = new MessagesService();
  }
  @Get()
  async listAllMessages() {
    return await this.messagesService.listAllMessages();
  }

  @Post()
  async createMessage(@Body() body: CreateMessageDto) {
    return await this.messagesService.createMessage(body.content);
  }

  @Get('/:id')
  async getMessageById(@Param('id') id: string) {
    const message = await this.messagesService.getMessageById(id);
    if (!message) {
      throw new NotFoundException('Message not found');
    }
    return message;
  }
}
