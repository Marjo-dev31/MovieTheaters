import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SessionsController } from './sessions/sessions.controller';
import { SessionsService } from './sessions/sessions.service';
import { SessionsModule } from './sessions/sessions.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'admin',
      password: 'mamou31',
      database: 'MovieTheaters',
      entities: ['dist/**/*.entity{.ts,.js}'],
      synchronize: true,
    }),
    SessionsModule,
  ],
  controllers: [AppController, SessionsController],
  providers: [AppService, SessionsService],
})
export class AppModule {}
