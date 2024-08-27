import { Injectable, Param } from '@nestjs/common';
import { DataSource } from 'typeorm';

@Injectable()
export class SessionsService {
  constructor(private dataSource: DataSource) {}
  getSessions() {
    const sessions = this.dataSource.query('SELECT * FROM sessions');
    return sessions;
  }

  async getSessionsByCinema(@Param() params: { cinemaId: string }) {
    const cinemaId = params.cinemaId;
    const sessionsByCinema = await this.dataSource.query(
      `SELECT * FROM sessions WHERE cinema_id = '${cinemaId}'`,
    );
    return sessionsByCinema;
  }
}
