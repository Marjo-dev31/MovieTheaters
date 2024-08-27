import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Movies {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  name: string;
}
