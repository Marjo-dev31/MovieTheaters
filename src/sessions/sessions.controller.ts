import { Controller, Get, Param } from '@nestjs/common';
import { SessionsService } from './sessions.service';

@Controller('sessions')
export class SessionsController {
  constructor(private readonly sessionsService: SessionsService) {}

  @Get()
  findAll() {
    return this.sessionsService.getSessions();
  }

  @Get('/:cinemaId')
  findByCinema(@Param('cinemaId') cinemaId: string) {
    return this.sessionsService.getSessionsByCinema({ cinemaId });
  }
}
