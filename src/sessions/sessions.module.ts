import { Module } from '@nestjs/common';
import { SessionsService } from './sessions.service';
import { SessionsController } from './sessions.controller';
import { Sessions } from './sessions.entity';

@Module({
  imports: [Sessions],
  providers: [SessionsService],
  controllers: [SessionsController],
})
export class SessionsModule {}
