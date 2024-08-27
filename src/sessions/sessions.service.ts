import { Injectable } from '@nestjs/common';
import { DataSource } from 'typeorm';

@Injectable()
export class SessionsService {
  constructor(private dataSource: DataSource) {}
  getSessions() {
    const sessions = this.dataSource.query('SELECT * FROM sessions');
    return sessions;
  }
}
