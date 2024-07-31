import React, { useState, useEffect } from "react";
import axios from "../../utils/axiosUtils";
import {
  Container,
  TextField,
  Button,
  Avatar,
  Grid,
  Box,
  IconButton,
  InputAdornment,
} from "@mui/material";
import { PhotoCamera, Visibility, VisibilityOff } from "@mui/icons-material";
import { useForm, Controller } from "react-hook-form";
import jduLogo from "../../assets/logo.png";
import SettingStyle from "./Setting.module.css";

const Setting = () => {
  const role = sessionStorage.getItem("role");
  const [user, setUser] = useState({});
  const [avatarImage, setAvatarImage] = useState(jduLogo);
  const [showCurrentPassword, setShowCurrentPassword] = useState(false);
  const [showNewPassword, setShowNewPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [isEditing, setIsEditing] = useState(false); // New state for edit mode

  const {
    control,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
    reset,
  } = useForm({
    defaultValues: {
      currentPassword: "",
      password: "",
      confirmPassword: "",
      first_name: "",
      last_name: "",
      phone: "",
      email: "",
      contactEmail: "test@jdu.uz",
      contactPhone: "+998 90 234 56 78",
      workingHours: "09:00 - 18:00",
      location: "Tashkent, Shayhontohur district, Sebzor, 21",
    },
  });

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const id = JSON.parse(sessionStorage.getItem("loginUser")).id;
        let response;
        if (role === "Admin") {
          response = await axios.get(`/api/admin/${id}`);
        } else if (role === "Student") {
          response = await axios.get(`/api/students/${id}`);
        } else if (role === "Staff") {
          response = await axios.get(`/api/staff/${id}`);
        } else if (role === "Recruiter") {
          response = await axios.get(`/api/recruiters/${id}`);
        }
        setUser(response.data);
        // Update form default values after fetching user data
        reset({
          first_name: response.data.first_name || "",
          last_name: response.data.last_name || "",
          phone: response.data.phone || "",
          email: response.data.email || "",
          contactEmail: response.data.contactEmail || "test@jdu.uz",
          contactPhone: response.data.contactPhone || "+998 90 234 56 78",
          workingHours: response.data.workingHours || "09:00 - 18:00",
          location:
            response.data.location ||
            "Tashkent, Shayhontohur district, Sebzor, 21",
        });
      } catch (error) {
        console.error("Failed to fetch user data:", error);
      }
    };

    fetchUser();
  }, [reset]);

  const handleAvatarChange = (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        setAvatarImage(e.target.result);
      };
      reader.readAsDataURL(file);
    }
  };

  const togglePasswordVisibility = (field) => {
    switch (field) {
      case "current":
        setShowCurrentPassword((prev) => !prev);
        break;
      case "new":
        setShowNewPassword((prev) => !prev);
        break;
      case "confirm":
        setShowConfirmPassword((prev) => !prev);
        break;
      default:
        break;
    }
  };

  const validatePasswords = (data) => {
    if (data.password !== data.confirmPassword) {
      return "Passwords do not match";
    }
    return true;
  };

  const onSubmit = async (data) => {
    const passwordValidation = validatePasswords(data);
    if (passwordValidation === true) {
      try {
        const id = JSON.parse(sessionStorage.getItem("loginUser")).id;

        await axios.put(`/api/admin/${id}`, {
          first_name: data.first_name,
          last_name: data.last_name,
          phone: data.phone,
          email: data.email,
          currentPassword: data.currentPassword,
          password: data.password,
          contactEmail: data.contactEmail,
          contactPhone: data.contactPhone,
          workingHours: data.workingHours,
          location: data.location,
        });

        alert("Profile updated successfully");
        setIsEditing(false);
      } catch (error) {
        console.error("Failed to update profile:", error);
        alert("Failed to update profile. Please try again.");
      }
    } else {
      alert(passwordValidation);
    }
  };

  const handleSync = async () => {
    try {
      await axios.post("api/kintone/sync");
      alert("Sync successful");
    } catch (error) {
      console.error("Sync failed:", error);
      alert("Sync failed. Please try again.");
    }
  };

  const handleEditClick = () => {
    setIsEditing(true);
  };

  const handleCancel = () => {
    setIsEditing(false);
    // Optionally reset form values to their initial state
    reset();
  };

  return (
    <Container>
      <Box
        display="flex"
        alignItems="center"
        justifyContent="space-between"
        className={SettingStyle["header"]}
      >
        <Box display="flex" alignItems="center">
          <Box display="flex" alignItems="center" position="relative" mr={2}>
            <Avatar
              alt="User Avatar"
              src={avatarImage}
              sx={{ width: 100, height: 100 }}
            />
            <label htmlFor="avatar-upload">
              <IconButton
                color="primary"
                aria-label="upload picture"
                component="span"
                size="small"
                sx={{
                  position: "absolute",
                  bottom: 4,
                  right: 4,
                  backgroundColor: "white",
                }}
              >
                <PhotoCamera />
              </IconButton>
            </label>
            <input
              accept="image/*"
              id="avatar-upload"
              type="file"
              style={{ display: "none" }}
              onChange={handleAvatarChange}
            />
          </Box>
          <Box ml={2}>
            <div className={SettingStyle["userTitle"]}>
              {user.first_name + " " + user.last_name || "User"}
            </div>
          </Box>
        </Box>
        <Box
          display="flex"
          alignItems="center"
          className={SettingStyle["button-group"]}
        >
          {!isEditing ? (
            <Button
              variant="outlined"
              color="primary"
              className={SettingStyle["edit-button"]}
              style={{ minWidth: "124px" }}
              onClick={handleEditClick}
            >
              編集
            </Button>
          ) : (
            <>
              <Button
                variant="outlined"
                color="primary"
                className={SettingStyle["cancel-button"]}
                style={{ minWidth: "124px" }}
                onClick={handleCancel}
              >
                キャンセル
              </Button>
              <Button
                variant="contained"
                color="primary"
                className={SettingStyle["save-button"]}
                onClick={handleSubmit(onSubmit)}
                style={{ minWidth: "76px" }}
              >
                保存
              </Button>
            </>
          )}
        </Box>
      </Box>
      <Box my={1} className={SettingStyle.syncButton}>
        {role === "Admin" && (
          <Button variant="contained" color="primary" onClick={handleSync}>
            同期
          </Button>
        )}
      </Box>
      <Grid container spacing={2} alignItems="center">
        <Grid item xs={12} sm={6}>
          <Controller
            name="first_name"
            control={control}
            render={({ field }) => (
              <TextField
                label="名"
                variant="outlined"
                fullWidth
                {...field}
                disabled={!isEditing}
              />
            )}
          />
        </Grid>
        <Grid item xs={12} sm={6}>
          <Controller
            name="last_name"
            control={control}
            render={({ field }) => (
              <TextField
                label="姓"
                variant="outlined"
                fullWidth
                {...field}
                disabled={!isEditing}
              />
            )}
          />
        </Grid>
        <Grid item xs={12} sm={6}>
          <Controller
            name="phone"
            control={control}
            render={({ field }) => (
              <TextField
                label="電話番号"
                variant="outlined"
                fullWidth
                {...field}
                disabled={!isEditing}
              />
            )}
          />
        </Grid>
        <Grid item xs={12} sm={6}>
          <Controller
            name="email"
            control={control}
            render={({ field }) => (
              <TextField
                label="メール"
                variant="outlined"
                fullWidth
                {...field}
                disabled={!isEditing}
              />
            )}
          />
        </Grid>
      </Grid>
      <Box className={SettingStyle["section"]}>
        <h2 className={SettingStyle["h2"]}>パスワードの変更</h2>
        <Grid container spacing={2}>
          <Grid item xs={12} sm={6}>
            <Controller
              name="currentPassword"
              control={control}
              render={({ field }) => (
                <TextField
                  label="現在のパスワード"
                  variant="outlined"
                  type={showCurrentPassword ? "text" : "password"}
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                  autoComplete="new-password"
                  InputProps={{
                    endAdornment: (
                      <InputAdornment position="end">
                        <IconButton
                          aria-label="toggle password visibility"
                          onClick={() => togglePasswordVisibility("current")}
                          edge="end"
                        >
                          {showCurrentPassword ? (
                            <VisibilityOff />
                          ) : (
                            <Visibility />
                          )}
                        </IconButton>
                      </InputAdornment>
                    ),
                  }}
                />
              )}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <Controller
              name="password"
              control={control}
              render={({ field }) => (
                <TextField
                  label="新しいパスワード"
                  variant="outlined"
                  type={showNewPassword ? "text" : "password"}
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                  autoComplete="new-password"
                  InputProps={{
                    endAdornment: (
                      <InputAdornment position="end">
                        <IconButton
                          aria-label="toggle password visibility"
                          onClick={() => togglePasswordVisibility("new")}
                          edge="end"
                        >
                          {showNewPassword ? <VisibilityOff /> : <Visibility />}
                        </IconButton>
                      </InputAdornment>
                    ),
                  }}
                />
              )}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <Controller
              name="confirmPassword"
              control={control}
              render={({ field }) => (
                <TextField
                  label="パスワードを認証する"
                  variant="outlined"
                  type={showConfirmPassword ? "text" : "password"}
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                  autoComplete="new-password"
                  InputProps={{
                    endAdornment: (
                      <InputAdornment position="end">
                        <IconButton
                          aria-label="toggle password visibility"
                          onClick={() => togglePasswordVisibility("confirm")}
                          edge="end"
                        >
                          {showConfirmPassword ? (
                            <VisibilityOff />
                          ) : (
                            <Visibility />
                          )}
                        </IconButton>
                      </InputAdornment>
                    ),
                  }}
                />
              )}
            />
          </Grid>
        </Grid>
      </Box>
      <Box className={SettingStyle["section"]}>
        <h2 className={SettingStyle["h2"]}>コンタクト情報</h2>
        <Grid container spacing={2}>
          <Grid item xs={12} sm={6}>
            <Controller
              name="contactEmail"
              control={control}
              render={({ field }) => (
                <TextField
                  label="メール"
                  variant="outlined"
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                />
              )}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <Controller
              name="contactPhone"
              control={control}
              render={({ field }) => (
                <TextField
                  label="電話番号"
                  variant="outlined"
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                />
              )}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <Controller
              name="workingHours"
              control={control}
              render={({ field }) => (
                <TextField
                  label="労働時間"
                  variant="outlined"
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                />
              )}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <Controller
              name="location"
              control={control}
              render={({ field }) => (
                <TextField
                  label="位置"
                  variant="outlined"
                  fullWidth
                  {...field}
                  disabled={!isEditing}
                />
              )}
            />
          </Grid>
        </Grid>
      </Box>
    </Container>
  );
};

export default Setting;
