# Import Libraries
import pandas as pd
import streamlit as st
import plotly.express as px

st.title('Special Plays Viewer')
st.text('This web app lets you view special teams plays & gives you extra insight')

df = pd.read_csv("../data/tracking2020.csv")

selected_game = st.selectbox(
     'Choose your game:',
     df['gameId'].unique())

df_game = df[df['gameId'] == selected_game]

selected_playid = st.selectbox(
     'Choose your play:',
     df_game['playId'].unique())

df_play = df_game[df_game['playId'] == selected_playid]


ani = px.scatter(df_play, x="x", y="y", animation_frame="frameId", animation_group="nflId",
           color="team", hover_name="displayName")

st.plotly_chart(ani, use_container_width=True)