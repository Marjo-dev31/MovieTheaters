import { Movies } from 'src/movies/movies.entity';
import {
  Column,
  Entity,
  JoinColumn,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Sessions {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  cinema_id: string;

  @Column()
  room_id: string;

  @OneToMany(() => Movies, (Movies) => Movies.id)
  @JoinColumn({ name: 'id' })
  movie_id: Movies;

  @Column()
  schedule_id: string;
}
