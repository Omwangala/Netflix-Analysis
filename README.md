Netflix Data Analysis SQL Project
Overview

This SQL project analyzes Netflix content data to uncover insights about movies and TV shows available on the platform. The analysis includes various queries that examine content types, ratings, durations, release patterns, and more.
Project Structure

The SQL file contains 15 analytical queries that explore different aspects of Netflix's content library.
Key Analyses
Content Distribution

    Count of Movies vs TV Shows

    Most common ratings by content type

    Top 5 countries with the most content

Temporal Analysis

    Movies released in specific years

    Content added in the last 5 years

    Yearly content release patterns from India

Content Characteristics

    Longest movie on Netflix

    TV shows with more than 5 seasons

    Content categorization based on description keywords

People Analysis

    Movies by specific directors

    Actors' appearances in content

    Content without director information

Genre Analysis

    Content count by genre

    Documentary movies

Technical Highlights

    Used window functions with RANK() for rating analysis

    Implemented UNNEST with STRING_TO_ARRAY for handling comma-separated values

    Applied date functions for temporal analysis

    Utilized ILIKE for case-insensitive pattern matching

    Created categories using CASE WHEN statements

How to Use

    Clone the repository

    Execute the SQL queries against a PostgreSQL database containing Netflix data

    Modify parameters (like years or names) to customize the analysis

Insights

The queries reveal:

    The distribution between movies and TV shows

    Popular content ratings

    Geographic distribution of content

    Temporal trends in content addition

    Content characteristics and categorization

This project demonstrates SQL skills in data extraction, transformation, and analysis of real-world entertainment data.
