# frozen_string_literal: true

Admin.create!([
                { name: 'Ankith', email: 'ankithpillay@gmail.com', password: '1234',
                  password_digest: '$2a$12$W0hWXf7ZqFWWz1haHDO/UemWzzVO8b0fL/2mkAdwq5hmU9o./z2KS' }
              ])
Event.create!([
                { title: 'Test Case', date: '2022-10-11', logincode: 'ham', location: 'Commons Lobby', eventpoints: 3,
                  starttime: '2022-10-11 17:00:00', endtime: '2022-10-14 18:00:00' }
              ])
