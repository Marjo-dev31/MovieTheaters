import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';
import { MovieBody } from './movies.controller';

@Injectable()
export class MoviesService {
  constructor(private readonly dataSource: DataSource) {}

  createMovie({ movieBody }: { movieBody: MovieBody }) {
    const movie = this.dataSource.query(
      `INSERT INTO movies(name) VALUES ('${movieBody.name}')`,
    );
    return movie;
  }
}
