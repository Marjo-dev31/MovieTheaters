import { Module } from '@nestjs/common';
import { Movies } from './movies.entity';
import { MoviesService } from './movies.service';
import { MoviesController } from './movies.controller';

@Module({
  imports: [Movies],
  providers: [MoviesService],
  controllers: [MoviesController],
})
export class MoviesModule {}
