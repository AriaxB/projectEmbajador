-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "mail" VARCHAR(100) NOT NULL,
    "age" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "state" BOOLEAN,
    "rolId" INTEGER NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roles" (
    "id" SERIAL NOT NULL,
    "rol_description" TEXT NOT NULL,

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "News" (
    "id" TEXT NOT NULL,
    "title" VARCHAR(200) NOT NULL,
    "descriptioon" VARCHAR(10000) NOT NULL,
    "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_At" TIMESTAMP(3) NOT NULL,
    "state" BOOLEAN,
    "userId" TEXT NOT NULL,

    CONSTRAINT "News_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Blogs" (
    "id" TEXT NOT NULL,
    "title" VARCHAR(1000) NOT NULL,
    "description" VARCHAR(6000) NOT NULL,
    "state" BOOLEAN NOT NULL,
    "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_At" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Blogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stadiums" (
    "id" TEXT NOT NULL,
    "name_stadium" TEXT NOT NULL,
    "image_stadium" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "city" TEXT NOT NULL,

    CONSTRAINT "Stadiums_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teams" (
    "id" TEXT NOT NULL,
    "team_name" VARCHAR(150) NOT NULL,
    "shield_image" TEXT,
    "country" VARCHAR(100) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "foundation_year" TIMESTAMP(3) NOT NULL,
    "nick_name" VARCHAR(100) NOT NULL,
    "stadiumId" TEXT NOT NULL,

    CONSTRAINT "Teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Players" (
    "id" TEXT NOT NULL,
    "first_name" VARCHAR(150) NOT NULL,
    "last_name" VARCHAR(150) NOT NULL,
    "born_date" TIMESTAMP(3) NOT NULL,
    "teamId" TEXT NOT NULL,
    "positionId" TEXT NOT NULL,

    CONSTRAINT "Players_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatisticsPlayers" (
    "id" TEXT NOT NULL,
    "played_games" INTEGER NOT NULL,
    "starter_games" INTEGER NOT NULL,
    "substitute_games" INTEGER NOT NULL,
    "goals_scored" INTEGER NOT NULL,
    "assists_made" INTEGER NOT NULL,
    "red_cards" INTEGER NOT NULL,
    "yellow_cards" INTEGER NOT NULL,
    "playerId" TEXT NOT NULL,

    CONSTRAINT "StatisticsPlayers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatisticsTeams" (
    "id" TEXT NOT NULL,
    "win_games" INTEGER NOT NULL,
    "defeate_games" INTEGER NOT NULL,
    "tied_games" INTEGER NOT NULL,
    "favor_goals" INTEGER NOT NULL,
    "against_goals" INTEGER NOT NULL,
    "played_matches" INTEGER NOT NULL,
    "teamId" TEXT NOT NULL,

    CONSTRAINT "StatisticsTeams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Matches" (
    "id" TEXT NOT NULL,
    "local_goals" INTEGER NOT NULL,
    "visitor_goals" INTEGER NOT NULL,
    "localTeamId" TEXT NOT NULL,
    "visitorTeamId" TEXT NOT NULL,
    "date_match" TIMESTAMP(3) NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "finish_date" TIMESTAMP(3) NOT NULL,
    "competitionId" TEXT NOT NULL,
    "stateId" TEXT NOT NULL,

    CONSTRAINT "Matches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LikesBlogs" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "blogId" TEXT NOT NULL,
    "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LikesBlogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LikesComments" (
    "id" TEXT NOT NULL,
    "commentId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LikesComments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Comments" (
    "id" TEXT NOT NULL,
    "description" VARCHAR(500) NOT NULL,
    "state" BOOLEAN NOT NULL,
    "blogId" TEXT NOT NULL,

    CONSTRAINT "Comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Positions" (
    "id" TEXT NOT NULL,
    "position_description" VARCHAR(90) NOT NULL,

    CONSTRAINT "Positions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StateMatches" (
    "id" TEXT NOT NULL,
    "state_description" VARCHAR(50) NOT NULL,

    CONSTRAINT "StateMatches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileImages" (
    "id" TEXT NOT NULL,
    "link_profile_image" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "ProfileImages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Competitions" (
    "id" TEXT NOT NULL,
    "competition_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Competitions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewsImages" (
    "id" TEXT NOT NULL,
    "link_new_image" TEXT NOT NULL,
    "newId" TEXT NOT NULL,

    CONSTRAINT "NewsImages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlayerPictures" (
    "id" TEXT NOT NULL,
    "link_player_image" TEXT NOT NULL,
    "playerId" TEXT NOT NULL,

    CONSTRAINT "PlayerPictures_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_username_key" ON "Users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Users_mail_key" ON "Users"("mail");

-- CreateIndex
CREATE UNIQUE INDEX "Teams_team_name_key" ON "Teams"("team_name");

-- CreateIndex
CREATE UNIQUE INDEX "StatisticsPlayers_playerId_key" ON "StatisticsPlayers"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "StatisticsTeams_teamId_key" ON "StatisticsTeams"("teamId");

-- CreateIndex
CREATE UNIQUE INDEX "LikesBlogs_userId_blogId_key" ON "LikesBlogs"("userId", "blogId");

-- CreateIndex
CREATE UNIQUE INDEX "LikesComments_userId_commentId_key" ON "LikesComments"("userId", "commentId");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileImages_userId_key" ON "ProfileImages"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "NewsImages_newId_key" ON "NewsImages"("newId");

-- CreateIndex
CREATE UNIQUE INDEX "PlayerPictures_playerId_key" ON "PlayerPictures"("playerId");

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_rolId_fkey" FOREIGN KEY ("rolId") REFERENCES "Roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "News" ADD CONSTRAINT "News_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teams" ADD CONSTRAINT "Teams_stadiumId_fkey" FOREIGN KEY ("stadiumId") REFERENCES "Stadiums"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Players" ADD CONSTRAINT "Players_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Teams"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Players" ADD CONSTRAINT "Players_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Positions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StatisticsPlayers" ADD CONSTRAINT "StatisticsPlayers_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Players"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StatisticsTeams" ADD CONSTRAINT "StatisticsTeams_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Teams"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matches" ADD CONSTRAINT "Matches_localTeamId_fkey" FOREIGN KEY ("localTeamId") REFERENCES "Teams"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matches" ADD CONSTRAINT "Matches_visitorTeamId_fkey" FOREIGN KEY ("visitorTeamId") REFERENCES "Teams"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matches" ADD CONSTRAINT "Matches_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES "Competitions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matches" ADD CONSTRAINT "Matches_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "StateMatches"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesBlogs" ADD CONSTRAINT "LikesBlogs_blogId_fkey" FOREIGN KEY ("blogId") REFERENCES "Blogs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesBlogs" ADD CONSTRAINT "LikesBlogs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesComments" ADD CONSTRAINT "LikesComments_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "Comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesComments" ADD CONSTRAINT "LikesComments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comments" ADD CONSTRAINT "Comments_blogId_fkey" FOREIGN KEY ("blogId") REFERENCES "Blogs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileImages" ADD CONSTRAINT "ProfileImages_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewsImages" ADD CONSTRAINT "NewsImages_newId_fkey" FOREIGN KEY ("newId") REFERENCES "News"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerPictures" ADD CONSTRAINT "PlayerPictures_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Players"("id") ON DELETE CASCADE ON UPDATE CASCADE;
