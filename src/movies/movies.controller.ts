import { Body, Controller, Post } from '@nestjs/common';
import { MoviesService } from './movies.service';

export type MovieBody = { name: string };
@Controller('movies')
export class MoviesController {
  constructor(private readonly moviesService: MoviesService) {}

  @Post()
  createMovie(@Body() movieBody: MovieBody) {
    return this.moviesService.createMovie({ movieBody });
  }
}
