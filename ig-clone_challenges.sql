SELECT * FROM users ORDER BY created_at LIMIT 5; -- oldest 5 users
SELECT DAYNAME(created_at) AS most_created_day, COUNT(*) AS count_of_users FROM users 
	GROUP BY most_created_day ORDER BY count_of_users DESC LIMIT 2; -- most account created day name
SELECT username FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL; -- users with zero photos
SELECT username, photos.id, photos.image_url, COUNT(*) AS count_of_likes FROM users 
	INNER JOIN photos ON users.id = photos.user_id
	INNER JOIN likes ON photos.id = likes.photo_id GROUP BY photos.id ORDER BY count_of_likes DESC LIMIT 1; -- most liked photo by username
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg; -- average posts
SELECT tag_name, COUNT(*) AS tag_count FROM tags 
	JOIN photo_tags ON tags.id = photo_tags.tag_id GROUP BY tags.id ORDER BY tag_count DESC LIMIT 5; -- 5 most used hashtags
SELECT username, COUNT(*) AS count_of_likes FROM users 
	INNER JOIN likes ON users.id = likes.user_id
	GROUP BY likes.user_id HAVING count_of_likes = (SELECT COUNT(*) FROM photos); -- users of liked each photo one-by-one
