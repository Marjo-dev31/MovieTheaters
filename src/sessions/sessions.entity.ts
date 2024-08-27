import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Sessions {
  @PrimaryGeneratedColumn()
  id: string;

  @Column()
  cinema_id: string;

  @Column()
  room_id: string;

  @Column()
  movie_id: string;

  @Column()
  schedule_id: string;
}
