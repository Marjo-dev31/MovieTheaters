import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SessionsController } from './sessions/sessions.controller';
import { SessionsService } from './sessions/sessions.service';
import { SessionsModule } from './sessions/sessions.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MoviesController } from './movies/movies.controller';
import { MoviesService } from './movies/movies.service';
import { MoviesModule } from './movies/movies.module';

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
      // synchronize: true,
    }),
    SessionsModule,
    MoviesModule,
  ],
  controllers: [AppController, SessionsController, MoviesController],
  providers: [AppService, SessionsService, MoviesService],
})
export class AppModule {}
