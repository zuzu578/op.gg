package com.myopgg.myopggapp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myopgg.myopggapp.dto.SummonerDto;




/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchSummoner {
	final static String API_KEY = "RGAPI-f416db96-87bf-46d1-8d6f-354850d961bf";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		
		return "home";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String result(Model model, HttpServletRequest httpServletRequest) {
		//VersionCheck.checkVersion();
		BufferedReader br = null;
		String SummonerName = httpServletRequest.getParameter("SummonerName");
		System.out.println("SummonerName===>"+SummonerName);
		SummonerDto temp= null;
		com.myopgg.myopggapp.dto.LeagueEntrydto[] leagueInfo = null;
		//LeagueEntrydto[] leagueInfo = null;
		try{            
			String urlstr = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+
					SummonerName.replace(" ", "")		+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
			String result = "";
			String line;
			while((line = br.readLine()) != null) { // 洹� 諛쏆븘�삩 臾몄옄�뿴�쓣 怨꾩냽 br�뿉�꽌 以꾨떒�쐞濡� 諛쏄퀬 異쒕젰�븯寃좊떎.
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			int profileIconId = k.get("profileIconId").getAsInt();
			String name = k.get("name").getAsString();
			System.out.println(name);
			String puuid = k.get("puuid").getAsString();
			long summonerLevel = k.get("summonerLevel").getAsLong();
			System.out.println(summonerLevel);
			long revisionDate = k.get("revisionDate").getAsLong();
			String id = k.get("id").getAsString();
			String accountId = k.get("accountId").getAsString();
			System.out.println(accountId);
			temp = new SummonerDto(profileIconId,name,puuid,summonerLevel,revisionDate,id,accountId);
			model.addAttribute("SummonerName",SummonerName);
			model.addAttribute("profileIconId",profileIconId);
			model.addAttribute("name",name);
			model.addAttribute("puuid",puuid);
			model.addAttribute("summonerLevel",summonerLevel);
			model.addAttribute("revisionDate",revisionDate);
			model.addAttribute("id",id);
			model.addAttribute("accountId",accountId);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		String[] leagueName = null ; 
		try{            
			String urlstr = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+
					temp.getId()		+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
			String result = "";
			String line;
			while((line = br.readLine()) != null) { // 洹� 諛쏆븘�삩 臾몄옄�뿴�쓣 怨꾩냽 br�뿉�꽌 以꾨떒�쐞濡� 諛쏄퀬 異쒕젰�븯寃좊떎.
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonArray arr = (JsonArray) jsonParser.parse(result);
			leagueInfo = new com.myopgg.myopggapp.dto.LeagueEntrydto[arr.size()];
			leagueName = new String[arr.size()];
			for(int i=0; i<arr.size(); i++) {
				JsonObject k =  (JsonObject) arr.get(i);
				int wins = k.get("wins").getAsInt();
				int losses = k.get("losses").getAsInt();
				String rank = k.get("rank").getAsString();
				String tier = k.get("tier").getAsString();
				String queueType = k.get("queueType").getAsString();
				int leaguePoints = k.get("leaguePoints").getAsInt();
				String leagueId = k.get("leagueId").getAsString();
				
				model.addAttribute("wins",wins);
				model.addAttribute("losses",losses);
				model.addAttribute("rank",rank);
				model.addAttribute("tier",tier);
				model.addAttribute("queueType",queueType);
				model.addAttribute("leaguePoints",leaguePoints);
				model.addAttribute("leagueId",leagueId);
				System.out.println("wins"+wins);
				System.out.println(losses);
				System.out.println(rank);
				System.out.println(tier);
				System.out.println(queueType);
				System.out.println(leaguePoints);
				System.out.println(leagueId);

				leagueInfo[i] = new com.myopgg.myopggapp.dto.LeagueEntrydto(queueType, wins, losses, leagueId, rank,tier, leaguePoints);
				urlstr = "https://kr.api.riotgames.com/lol/league/v4/leagues/"+
						leagueInfo[i].getLeagueId()		+"?api_key="+API_KEY;
				url = new URL(urlstr);
				urlconnection = (HttpURLConnection) url.openConnection();
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
				result = "";
				line ="";
				while((line = br.readLine()) != null) { // 洹� 諛쏆븘�삩 臾몄옄�뿴�쓣 怨꾩냽 br�뿉�꽌 以꾨떒�쐞濡� 諛쏄퀬 異쒕젰�븯寃좊떎.
					result = result + line;
				}
				jsonParser = new JsonParser();
				k = (JsonObject) jsonParser.parse(result);
				leagueName[i] = k.get("name").getAsString();
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		System.out.print(leagueInfo[0]);
		model.addAttribute("summoner", temp);
		//https://opgg-static.akamaized.net/images/profile_icons/profileIcon6.jpg?image=q_auto:best&v=1518361200
		model.addAttribute("profileImgURL", "https://opgg-static.akamaized.net/images/profile_icons/profileIcon"+temp.getProfileIconId()+".jpg?image=q_auto:best&v=1518361200");
		model.addAttribute("leagueInfo", leagueInfo);
		model.addAttribute("tierImgURL", "img/emblems/Emblem_"+leagueInfo[0].getTier()+".png");
		model.addAttribute("leagueName", leagueName);
	
		
		
		
		return "result";
		
		
		
		
		
		
		
		
		
		
		
		
	
		
	}
	
	
}
